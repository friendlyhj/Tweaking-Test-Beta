#loader preinit
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;
import extrautilities2.Tweaker.IMachineSlot;



val a as IMachineSlot = IMachineSlot.newItemStackSlot("a", 64);
val b as IMachineSlot = IMachineSlot.newItemStackSlot("b", 64);
val c as IMachineSlot = IMachineSlot.newItemStackSlot("c", true, 64);

val metalTransformer as IMachine = IMachineRegistry.createNewMachine(
    "metal_transformer",
    1000000,
    100000,
    [a],
    [b],
    "xu2:blocks/transformer",
    "xu2:blocks/transformer_active"
);

extrautilities2.Tweaker.IMachineRegistry.createNewGenerator(
    "generator_gem",
    1200000,
    600000,
    [a],
    [c],
    "2",
    "frontTextureActive",
    0x66ccff
);