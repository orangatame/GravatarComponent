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


/**
 Class for constructing Gravatar avatar URLs.
 See http://en.gravatar.com/site/implement/url
 */
public global class GravatarComponentController {
    private final Integer MAX_SIZE = 512; // pixels
    private final Integer MIN_SIZE = 1; // pixels

    public String emailAddress {get; set;}
    public Integer size {
	get;
	set {
	    /* clamp values between MIN_SIZE and MAX_SIZE */
	    if (value < MIN_SIZE) {
		size = MIN_SIZE;
	    } else if (value > MAX_SIZE) {
		size = MAX_SIZE;
	    } else {
		size = value;
	    }
	}
    }

    public GravatarComponentController() {
	size = 80; /* default value from Gravatar */
    }

    public String getGravatarImageUrl() {
	//1. lowercase the email address
	emailAddress = emailAddress.toLowerCase();
	//2. strip whitespace
	emailAddress = emailAddress.trim();
	//3. md5 hex digest
	Blob hash = Crypto.generateDigest('MD5', Blob.valueOf(emailAddress));
	String hexDigest = EncodingUtil.convertToHex(hash);
	//4. compose URL
	String url = 'http://www.gravatar.com/avatar/' + hexDigest + '.jpg';
	//5. append parameters
	if (size > 0) {
	    url += '?size=' + size;
	}
	return url;
    }

}

