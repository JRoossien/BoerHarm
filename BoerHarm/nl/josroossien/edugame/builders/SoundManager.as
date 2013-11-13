package nl.josroossien.edugame.builders {

import flash.display.MovieClip;
import flash.events.Event;
import flash.media.Sound;
import flash.media.SoundChannel;

import nl.josroossien.edugame.display.MenuS;

public class SoundManager extends MovieClip {
	
	public static var soundMan:SoundManager;
	
	public var playing:String;
	
	private var springS:SpringSound = new SpringSound();
	private var springSC:SoundChannel;
	private var summerS:SummerSound = new SummerSound();
	private var summerSC:SoundChannel;
	private var autumnS:AutumnSound = new AutumnSound();
	private var autumnSC:SoundChannel;
	private var winterS:WinterSound = new WinterSound();
	private var winterSC:SoundChannel;
	private var jumpS:JumpSound = new JumpSound();
	private var jumpSC:SoundChannel;
	private var landS:JumplandSound = new JumplandSound();
	private var landSC:SoundChannel;
	private var throwS:ShootSound = new ShootSound();
	private var throwSC:SoundChannel;
	private var damageS:DamageS = new DamageS();
	private var damageSC:SoundChannel;
	private var itemS:ItemCollectS = new ItemCollectS();
	private var itemSC:SoundChannel;
	private var potatoS:PotatoS = new PotatoS();
	private var potatoSC:SoundChannel;
	private var winS:WinSound = new WinSound();
	private var winSC:SoundChannel;
	private var menuS:MenuSound = new MenuSound();
	private var menuSC:SoundChannel;
	private var clickS:ButtonS = new ButtonS();
	private var clickSC:SoundChannel;
	
	public function SoundManager() {
		soundMan = this;
	}
	
	public function getSM():SoundManager {
		return soundMan;
	}
	
	public function playSound(sound:String):void {
		trace("Playing sound: " + sound);
		switch (sound) {
			case "spring":
				springSC = springS.play();
				springSC.addEventListener(Event.SOUND_COMPLETE, soundComplete);
				playing = sound;
				break;
			case "summer":
				summerSC = summerS.play();
				summerSC.addEventListener(Event.SOUND_COMPLETE, soundComplete);
				playing = sound;
				break;
			case "autumn":
				autumnSC = autumnS.play();
				autumnSC.addEventListener(Event.SOUND_COMPLETE, soundComplete);
				playing = sound;
				break;
			case "winter":
				winterSC = winterS.play();
				winterSC.addEventListener(Event.SOUND_COMPLETE, soundComplete);
				playing = sound;
				break;
			case "jump":
				jumpSC = jumpS.play();
				break;
			case "land":
				landSC = landS.play();
				break;
			case "throw":
				throwSC = throwS.play();
				break;
			case "damage":
				damageSC = damageS.play();
				break;
			case "item":
				itemSC = itemS.play();
				break;
			case "potato":
				potatoSC = potatoS.play();
				break;
			case "win":
				winSC = winS.play();
				break;
			case "menu":
				if (playing != sound) {
					menuSC = menuS.play();
					menuSC.addEventListener(Event.SOUND_COMPLETE, soundComplete);
					playing = sound;
				}
				break;
			case "click":
				clickSC = clickS.play();
				break;
			default:
				trace("INFO: Unknown sound!");
		}
	}
	
	public function stopSound(sound:String):void {
		switch (sound) {
			case "spring":
				springSC.stop();
				springSC.removeEventListener(Event.SOUND_COMPLETE, soundComplete);
				break;
			case "summer":
				summerSC.stop();
				summerSC.removeEventListener(Event.SOUND_COMPLETE, soundComplete);
				break;
			case "autumn":
				autumnSC.stop();
				autumnSC.removeEventListener(Event.SOUND_COMPLETE, soundComplete);
				break;
			case "winter":
				winterSC.stop();
				winterSC.removeEventListener(Event.SOUND_COMPLETE, soundComplete);
				break;
			case "jump":
				jumpSC.stop();
				break;
			case "land":
				landSC.stop();
				break;
			case "throw":
				throwSC.stop();
				break;
			case "damage":
				damageSC.stop();
				break;
			case "item":
				itemSC.stop();
				break;
			case "potato":
				itemSC.stop();
				break;
			case "win":
				winSC.stop();
				break;
			case "menu":
				menuSC.stop();
				menuSC.removeEventListener(Event.SOUND_COMPLETE, soundComplete);
				break;
			case "click":
				clickSC.stop();
				break;
			default:
				trace("INFO: Unknown sound!");
		}
	}
	
	public function stopAllSound():void {
		stopSound(playing);
		playing = "none";
	}
	
	private function soundComplete(event:Event):void {
		SoundChannel(event.target).removeEventListener(event.type, soundComplete);
		playSound(playing);
	}
}
}