import crafttweaker.item.IIngredient;
import crafttweaker.item.WeightedItemStack;
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;

val metalTransformer as IMachine = IMachineRegistry.getMachine("crafttweaker:metal_transformer");
val gemGenerator as IMachine = IMachineRegistry.getMachine("generator_gem");


metalTransformer.addRecipe({"a" : <item:minecraft:iron_ingot> * 4}, {"b" : <item:minecraft:gold_ingot> * 1}, 40000, 60);
gemGenerator.addRecipe({"a" : <item:minecraft:diamond>}, {"c" : null}, 1200000, 600);


game.setLocalization("machine.crafttweaker:metal_transformer", "金属转换器");

game.setLocalization("machine.crafttweaker:generator_gem", "宝石发电机");