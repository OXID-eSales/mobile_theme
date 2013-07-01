OXID eShop Mobile Theme & OXID eShop theme switch
============================================

The extension OXID eShop Mobile Theme consists of a mobile theme and a module that is able to switch between different user agents.

![OXID eShop mobile theme](mobile.png)

###Features

* Checkout
* Products filter
* Products sorting
* Search
* Browse through categories and products
* Login/Register
* PayPal is already build in
* CMS pages
* Switch to standard website
* Supporting OXID eShop Community Edition & Enterprise Edition
* Full legal compliance

###Setup

As this extension consists of two components, the "theme switch" module and the theme itself, two installation steps have to be done.

<b>Theme installation:</b>

1. copy files from "theme/source" to your shop directory.<br>
2. please do not activate OXID eShop mobile theme. Leave the theme you want to be displayed, for non-mobile devices, activated (for example "Azure"). The "theme switch" module will recognize a mobile device and switch automatically to the mobile theme.<br>

<b>"Theme switch" module installation:</b>

1. copy files from "module/source" to your shop directory.<br>
2. activate the module.<br>
3. the "theme switch" module allows you to switch to any theme you want, so if there is need to use different theme, in module settings, enter the name of the theme that shall be used with mobile devices (this theme must be installed before).<br>
4. if you are using varnish cache (EE only), please merge the file "device.vcl" with your existing varnish configuration file. If you're not running an EE you can ditch this file.<br>

###How to Contribute

First off, you have to fork the repository "OXIDprojects/mobile_theme" to your list of repositories.

<b>Best practice</b>: 
* please leave the the branch names as they are
* if you want to fix a bug or develop a new feature, define an own branch in your repository. Name it e.g. "feature/foo" or "bug/bugname" for better traceability
* change whatever you want and send a pull request back to the original branch. 

For more information about this, please see:<br>
http://codeinthehole.com/writing/pull-requests-and-other-good-practices-for-teams-using-github/

You will find technical help with Git and GitHub on this place:<br>
https://help.github.com/

When sending your pull request, please provide a clear, meaningful and detailed information about what your code is about and what it will do, best including a screen shot if possible.


###License

OXID eSales Mobile Theme extension is free software: you can redistribute and/or modify it under the terms of the GNU General Public License as published by Free Software Foundation, either version 3 of the License, or (at your option) any later version.

OXID eSales Mobile Theme extension is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with OXID eSales Mobile Theme extension.  If not, see <http://www.gnu.org/licenses/>.