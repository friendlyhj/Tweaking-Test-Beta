#ignoreBracketErrors

import scripts.grassUtils.GrassUtils;
import scripts.grassUtils.Logger;
import scripts.grassUtils.RecipeUtils;
import scripts.compatSkills.SkillLocker;
import scripts.compatSkills.SkillStack.SkillStack;
import scripts.compatSkills.SkillStack.getSkillStack;
import scripts.compatSkills.Utils.getStage;

Logger.sendInfo(GrassUtils.i18nValued("youyihj.test", ["TG"]));

RecipeUtils.removeAllRecipe(<minecraft:bedrock>);

<item:minecraft:iron_ore>.asBlock().definition.lightOpacity = 255;

print(<liquid:redstone>.definition.name);

<item:minecraft:iron_ingot>.addShiftTooltip("233", "按住Shift键显示更多");

/* SkillLocker.lockItem(<item:extrautils2:angelring>, [SkillStack(<skill:reskillable:magic>, 24), SkillStack(<skill:reskillable:mining>, 8)]);
SkillLocker.lockMod("thermalfoundation", [SkillStack(<skill:reskillable:building>, 8)]);

SkillLocker.lockItemWithStage(<item:minecraft:anvil>, {
    1 : getSkillStack(<skill:reskillable:mining>, 6), 
    2 : getSkillStack(<skill:reskillable:magic>, 2)
}); */

val funcs as function(int)int = function(a as int) as int{
    return 2 * a;
};

val funcs2 as function(int)int = function(a as int) as int{
    return 3 * a;
};

print(funcs(2));
print(funcs2(4));