#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import crafttweaker.data.IData;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.ActionResult;

function getOffset(pos as BlockPos, x as int, y as int, z as int) as BlockPos{
    var offset as BlockPos = pos;
    if (x > 0) {
        offset = offset.getOffset("east", x);
    } else if (x < 0) {
        offset = offset.getOffset("west", -x);
    }

    if (y > 0) {
        offset = offset.getOffset("up", y);
    } else if (y < 0) {
        offset = offset.getOffset("down", -y);
    }

    if (z > 0) {
        offset = offset.getOffset("south", z);
    } else if (z < 0) {
        offset = offset.getOffset("north", -z);
    }

    return offset;
}

val clearTool as Item = VanillaFactory.createItem("clear_tool");
clearTool.maxStackSize = 1;
clearTool.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (!world.remote) {
        if (player.data.clearToolFlag.asInt() == 0) {
            player.sendMessage("警告！将清除9×9×9范围的所有方块，再次右击执行操作。");
            player.update(player.data + {clearToolFlag : 1 as int});
        } else {
            player.update(player.data + {clearToolFlag : 0 as int});
            var offsetPos as BlockPos = pos;
            for x in 0 .. 9 {
                for y in 0 .. 9 {
                    for z in 0 .. 9 {
                        offsetPos = getOffset(pos, x - 4, y - 4, z - 4);
                        var blockstate as BlockState = world.getBlockState(offsetPos);
                        // if (blockstate.block.definition.hardness != -1) {
                            world.setBlockState(<block:minecraft:air>, offsetPos);
                        //}
                    }
                }   
            }
            player.getHeldItem(hand).shrink(1);
        }
        return ActionResult.success();
    }
    return ActionResult.pass();
};
clearTool.register();