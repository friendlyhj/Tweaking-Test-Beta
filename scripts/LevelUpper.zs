#ignoreBracketErrors
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Commands;
import mods.compatskills.PlayerSkillInfo;
import mods.compatskills.Skill;
import scripts.grassUtils.GrassUtilsCot;

val upper as Item = VanillaFactory.createItem("level_upper");
upper.maxStackSize = 1;
upper.rarity = "EPIC";
upper.itemRightClick = function(item, world, player, hand) {
    if (world.remote) return "Pass";
    item.shrink(1);
    val allSkills as Skill[] = [
        <skill:compatskills:machinery>,
        <skill:reskillable:magic>
    ];
    var i as int = 0;
    var k as int = 0;
    var info as PlayerSkillInfo = null;
    while ((isNull(info) || info.getLevel() >= info.getSkill().cap) && i < 10) {
        k = world.getRandom().nextInt(allSkills.length);
        info = player.skillData.getSkillInfo(allSkills[k]);
        i += 1;
    }
    if (i < 10) {
        Commands.call("/reskillable incrementskill " ~ player.name ~ " " ~ allSkills[k].key ~ " 1", player, world, false, true);
        player.sendStatusMessage(GrassUtilsCot.i18nValued("message.isc.level_upper.success", [allSkills[k].name, info.getLevel()]), true);
    } else {
        player.sendStatusMessage(GrassUtilsCot.i18n("message.isc.level_upper.fail"), true);
    }
    return "Success";
};
upper.register();