#loader contenttweaker
#ignoreBracketErrors
#modloaded tconstruct
import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.contenttweaker.tconstruct.TraitDataRepresentation;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.contenttweaker.tconstruct.Material;
import mods.contenttweaker.tconstruct.Trait;
import mods.tconstruct.traits.AfterHit;
import mods.contenttweaker.World;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.ctutils.utils.Math;


function spawnItem(world as IWorld, item as IItemStack, pos as IBlockPos) as bool{
    return world.spawnEntity(item.createEntityItem(world, pos));
}

/* function traitKillEntitySpecialDrop(entityID as string, item as IItemStack, baseWeight as double) as AfterHit {
    return function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
        val world as IWorld = target.world;
        val current as int = trait.getData(tool).current; //获取特性的子等级
        val multiple as double = (0.96 + 0.04 * current); // 计算倍速 
        val chance as double = baseWeight * multiple;
        if (!world.remote && !target.alive && target.definition.id == entityID && Math.random() <= chance) {
            spawnItem(world, item, target.position3f.asBlockPos());
        }
    };
} */

function notApply(trait as string, otherTraits as string[]) as bool {
    for i in otherTraits {
        if (i == trait) {
            return false;
        }
    }
    return true;
}

val test = TraitBuilder.create("test_trait");
test.color = 0xff5555;
test.maxLevel = 2;
test.countPerLevel = 100;
test.addItem(<item:minecraft:arrow>); //强化所需物品 
test.canApplyTogetherTrait = function(thisTrait, otherTrait){
    return notApply(otherTrait, [
        "lightweight" //不兼容的特性列表
    ]);
};
test.localizedName = "时移";
test.localizedDescription = "...";
test.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    val world as IWorld = target.world;
    if (!world.remote && !target.alive && target.definition.id == "minecraft:skeleton") {
        val current as int = trait.getData(tool).current; //获取特性的子等级
        val baseWeight as double = 0.3; //初始几率
        val multiple as double = (0.96 + 0.04 * current); // 计算倍数 
        var chance as double = baseWeight * multiple;
        val pos as IBlockPos = target.position3f.asBlockPos();
        while (chance > 1) {
            spawnItem(world, <item:minecraft:coal>, pos);
            chance -= 1;
        }
        if (Math.random() <= chance) {
            spawnItem(world, <item:minecraft:coal>, pos);
        }
    }
};
test.register();