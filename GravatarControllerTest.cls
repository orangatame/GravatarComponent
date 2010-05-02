/*
  Copyright 2010 Orangatame LLC

  This file is part of GravatarComponent.

  GravatarComponent is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  
  GravatarComponent is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with GravatarComponent.  If not, see <http://www.gnu.org/licenses/>.
*/

@isTest
private class GravatarControllerTest {

    static testMethod void testDefaultSettings() {
	GravatarComponentController grav = new GravatarComponentController();
	System.assertEquals(80, grav.size);
	System.assertEquals(null, grav.emailAddress);
    }

    static testMethod void testSize() {
	/* test clamping of size parameter */
	GravatarComponentController grav = new GravatarComponentController();
	System.assertEquals(80, grav.size);
	grav.size = -1;
	System.assertEquals(1, grav.size);
	grav.size = 0;
	System.assertEquals(1, grav.size);
	grav.size = 512;
	System.assertEquals(512, grav.size);
	grav.size = 513;
	System.assertEquals(512, grav.size);
    }

    static testMethod void testRating() {

    }

    static testMethod void testDefaultPhoto() {

    }

    static testMethod void testUrls() {
	GravatarComponentController grav = new GravatarComponentController();
	grav.emailAddress = 'iHaveAn@email.com';
	System.assertEquals('http://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802.jpg', grav.getGravatarImageUrl());
	grav.size = 128;
	System.assertEquals('http://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802.jpg?size=128', grav.getGravatarImageUrl());
    }
}