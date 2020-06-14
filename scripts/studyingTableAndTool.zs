#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;
import mods.contenttweaker.ActionResult;
import crafttweaker.data.IData;
import mods.contenttweaker.DropHandler;
import mods.ctutils.player.Player;
import mods.ctutils.utils.Math;

val studyingTableEmpty as Block = VanillaFactory.createBlock("studying_table", <blockmaterial:wood>);
studyingTableEmpty.blockHardness = 3.0f;
studyingTableEmpty.toolClass = "axe";
studyingTableEmpty.register();

val studyingTable as Block = VanillaFactory.createBlock("studying_table_with_paper", <blockmaterial:wood>);
studyingTable.blockHardness = 3.0f;
studyingTable.toolClass = "axe";
studyingTable.setDropHandler(function(drops, world, position, state, fortune) {
    drops.clear();
    drops.add(<item:contenttweaker:studying_table> % 100);
    drops.add(<item:contenttweaker:studying_paper> % 100);
});
studyingTable.register();

val inspiration as Item = VanillaFactory.createItem("inspiration");
inspiration.register();

val paper as Item = VanillaFactory.createItem("studying_paper");
paper.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (!world.remote) {
        if (world.getBlockState(pos) == <block:contenttweaker:studying_table>) {
            world.setBlockState(<block:contenttweaker:studying_table_with_paper>, pos);
            player.getHeldItem(hand).shrink(1);
            return ActionResult.success();
        }
    }
    return ActionResult.pass();
};
paper.register();


val pen as Item = VanillaFactory.createItem("pen");
pen.maxStackSize = 1;
pen.maxDamage = 720;
pen.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (!world.remote && !Player.isFake(player)) {
        var process as int = player.data.studyProcess.asInt();
        if (world.getBlockState(pos) == <block:contenttweaker:studying_table_with_paper> && process % 10 == 0) {
            player.getHeldItem(hand).damage(1, player);
            process += 1;
            player.update(player.data + {studyProcess : process as int});
            if (process >= 200) {
                player.update(player.data + {studyProcess : 0 as int});
                if (Math.random() >= 0.9f) {
                    world.spawnEntity(<item:contenttweaker:inspiration>
                    .createEntityItem(world, pos.getOffset("up", 2)));
                    player.sendMessage("一丝灵感划过你的脑海，你赶紧记录下来。");
                } else {
                    player.sendMessage("失败……");
                }
                world.setBlockState(<block:contenttweaker:studying_table>, pos);
            }
            return ActionResult.success();
        }
    }
    return ActionResult.pass();
};
pen.register();


