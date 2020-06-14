#loader contenttweaker
import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.TileEntityRepresentation;
import mods.contenttweaker.TileEntity;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;
import crafttweaker.world.IRayTraceResult;


val system as MaterialSystemHelper = CotUtils.getMaterialSystemHelper();
system.registerMaterial("gold", 0xFFFF00);
system.registerNormalPart("gear", "item", false);
system.registerAllMaterialParts();

CotUtils.addNormalItem("test_item");

/* val a as TileEntityRepresentation = VanillaFactory.createTileEntity("test_tile_entity");
a.serverUpdate = function(world, blockPos, tileEntityData) {
    print("update!");
};
a.register(); */

val ab as Block = VanillaFactory.createBlock("test_block", <blockmaterial:iron>);
// ab.tileEntityRepresentation = a;
ab.register();

val tester as Item = VanillaFactory.createItem("tester");
tester.itemRightClick = function(stack, world, player, hand) {
    if (world.remote) return "PASS";
    val result as IRayTraceResult = player.getRayTrace(10.0f, 30.0f);
    if (isNull(result)) {
        player.sendMessage("NULL!");
    } else {
        player.sendMessage("IS_MISS : " ~ result.isMiss);
        player.sendMessage("IS_BLOCK : " ~ result.isBlock);
        player.sendMessage("IS_ENTITY : " ~ result.isEntity);
    }
    return "SUCCESS";
};
tester.register();