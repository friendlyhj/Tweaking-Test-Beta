#priority 666
#loader contenttweaker

import mods.contenttweaker.VanillaFactory;//导入原版加工厂
import mods.contenttweaker.Item;//导入物品包
import mods.contenttweaker.CreativeTab;//导入创造标签包
import mods.contenttweaker.Player;

val maple as Item = VanillaFactory.createItem("maple");//添加物品"maple"
maple.glowing = true;//附魔光泽
maple.maxStackSize = 32;//最大堆叠
maple.rarity = "epic";//史诗物品
val tab as CreativeTab = VanillaFactory.createCreativeTab("skyless", maple);//添加创造标签"skyless"
tab.register();//注册创造标签
maple.creativeTab = <creativetab:skyless>;//将maple归于"skyless"下
maple.onItemUpdate = function(item, world, owner, slot, isSelected) {
    if (!world.remote && owner instanceof Player && isSelected) {
        val player as Player = owner;
        player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(2, 1));
    }
};
maple.register();//注册物品