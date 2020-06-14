import mods.compatskills.Skill;
import scripts.compatSkills.SkillLocker;
import scripts.compatSkills.EnumSkill;
import scripts.compatSkills.SkillStack.getSkillStack;

SkillLocker.tweakLockedRecipe(false, <extendedcrafting:crafting_core>,
[[<item:minecraft:diamond>, <item:minecraft:emerald>]], [
    getSkillStack(EnumSkill.MACHINERY, 4),
    getSkillStack(EnumSkill.MAGIC, 2)
]);

SkillLocker.lockItem(<item:botania:altar>, [
    getSkillStack(EnumSkill.MAGIC, 10)
]);