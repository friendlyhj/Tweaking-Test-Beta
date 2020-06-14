#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Player;
import crafttweaker.player.IFoodStats;
import crafttweaker.block.IMaterial;
import crafttweaker.block.IBlockState;
import crafttweaker.block.IBlockDefinition;

val healAxe as Item = VanillaFactory.createItem("heal_axe");
healAxe.maxDamage = 1158;
healAxe.maxStackSize = 1;
healAxe.toolClass = "axe";
healAxe.toolLevel = 3;
healAxe.itemDestroyedBlock = function(stack, world, state, pos, entity) {
    val def as IBlockDefinition = state.block.definition;
    if (def.harvestTool == "axe" || def.defaultState.material.matches(IMaterial.wood())) {
        stack.damage(1, entity);
        return true;
    } else {
        stack.damage(2, entity);
        return false;
    }
};
healAxe.itemDestroySpeed = function(stack, state) {
    val def as IBlockDefinition = state.block.definition;
    return (def.harvestTool == "axe" || def.defaultState.material.matches(IMaterial.wood())) ? 8.0f : 1.0f;
};
healAxe.onItemUpdate = function(stack, world, owner, slot, isSelected) {
    if (world.getRandom().nextInt(80) != 27) return;
    if (!world.remote && owner instanceof Player && isSelected) {
        val player as Player = owner;
        val foodStats as IFoodStats = player.foodStats;
        if (foodStats.foodLevel < 20) {
            foodStats.foodLevel += 1;
        } else if (foodStats.saturationLevel < 10.0f) {
            foodStats.saturationLevel += 0.5f;
        }
    }
};
healAxe.register();