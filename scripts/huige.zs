#loader crafttweaker
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerInteractEvent;
import crafttweaker.player.IPlayer;

events.onPlayerInteract(function(event as PlayerInteractEvent) {
    val player as IPlayer = event.player;
    if (isNull(player.currentItem)) return;
    if (!event.world.remote && player.getRayTrace(6.0f, 30.0f).isMiss && player.currentItem in <item:minecraft:clock>) {
        print("?");
        player.sendStatusMessage("咕咕咕咕", false);
        //player.sendChat("咕咕咕");
        //player.sendMessage("咕咕咕");
        //三种发消息方法，自己选择
    }
});

print(<item:minecraft:iron_axe>.toolClasses[0]);