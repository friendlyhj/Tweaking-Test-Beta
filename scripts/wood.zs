import crafttweaker.item.IItemStack;

for log in <ore:logWood>.items {
    val plankF as IItemStack = recipes.craft([[log]]);
    if (!isNull(plankF)) {
        print("tweak!");
        val plank as IItemStack = plankF.withAmount(1);
        recipes.removeShaped(plank, [[log]]);
        recipes.addShaped(plank * 2, [[log]]);
    } else {
        print("null!");
    }
}