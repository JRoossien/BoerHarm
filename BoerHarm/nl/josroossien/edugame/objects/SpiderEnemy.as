﻿package nl.josroossien.edugame.objects  {

import flash.display.MovieClip;
import flash.events.Event;
import flash.geom.Rectangle;

import flashx.textLayout.elements.BreakElement;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.display.GameS;
import nl.josroossien.edugame.utils.MathUtil;
import nl.josroossien.edugame.utils.RectangleCollision;
	
		private var web:Web;
		private var maxFall:Number = 0;
			this.maxFall = MathUtil.randomNumber(250,600);
			if (this.y > this.maxFall) {
				vyE = -6;
			}
			if (this.y < 50) {
				vyE = 10;
			}
			
		}