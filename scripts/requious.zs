import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;

val metalTransformer = <assembly:metal_transformer>;

metalTransformer.setItemSlot(2, 2, ComponentFace.back(), 64).setAccess(true, false).setGroup("input");
metalTransformer.setItemSlot(4, 2, ComponentFace.front(), 64).setAccess(false, true).setGroup("output");
metalTransformer.setEnergySlot(0, 2, ComponentFace.all(), 100000).setAccess(true, false).setGroup("energy");
metalTransformer.setJEIItemSlot(2, 2, "input");
metalTransformer.setJEIEnergySlot(0, 2, "energy");
metalTransformer.setJEIItemSlot(4, 2, "output");
metalTransformer.setJEIDurationSlot(3, 2, "input", SlotVisual.create().addPart("requious:textures/gui/assembly_gauges.png", 0, 8));
metalTransformer.setDurationSlot(3, 2).setGroup("input").setTexture(0,8,mods.requious.GaugeDirection.right());

val recipe = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output", <minecraft:gold_ingot>);
}).requireItem("input", <minecraft:iron_ingot> * 4).requireDuration("input", 100).requireEnergy("energy", 40000);

metalTransformer.addRecipe(recipe);
metalTransformer.addJEIRecipe(recipe);