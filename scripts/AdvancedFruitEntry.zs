import mods.botania.Lexicon;
import mods.botania.RuneAltar;

RuneAltar.addRecipe(<item:contenttweaker:advanced_infinite_fruit>, [
    <botania:infinitefruit>,
    <botania:manaresource:14>,
    <botania:manaresource:15>,
    <botania:manaresource:15>,
    <botania:manaresource:15>,
    <botania:manaresource:15>,
    <botania:manaresource:2>,
    <botania:manaresource:9>,
    <botania:rune:9>,
    <botania:rune:10>,
    <botania:rune:12>
], 100000);

Lexicon.addEntry(game.localize("item.contenttweaker.advanced_infinite_fruit.name"), "botania.category.alfhomancy", <item:contenttweaker:advanced_infinite_fruit>);
Lexicon.addTextPage("只需要一点点盖亚和末影的力 量加以引导，&1禁忌之果&0能被升 级为&1饕餮之果&0。 它可以自动补充饱食度，无需 玩家自行食用。 同时它的消耗魔力的量比禁忌 之果稍微少一点。 与其他遗物不同，它需要手持 右键后绑定玩家后才能使用。", game.localize("item.contenttweaker.advanced_infinite_fruit.name"), 0);
Lexicon.addRunePage("比苹果好。", game.localize("item.contenttweaker.advanced_infinite_fruit.name"), 1, [<item:contenttweaker:advanced_infinite_fruit>], [[
    <botania:infinitefruit>,
    <botania:manaresource:14>,
    <botania:manaresource:15>,
    <botania:manaresource:15>,
    <botania:manaresource:15>,
    <botania:manaresource:15>,
    <botania:manaresource:2>,
    <botania:manaresource:9>,
    <botania:rune:9>,
    <botania:rune:10>,
    <botania:rune:12>
]], [100000]);