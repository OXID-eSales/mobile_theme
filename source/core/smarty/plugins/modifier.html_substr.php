<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */
/**
-------------------------------------------------------------
* File: modifier.html_substr.php
* Type: modifier
* Name: html_substr
* Version: 1.0
* Date: June 19th, 2003
* Purpose: Cut a string preserving any tag nesting and matching.
* Install: Drop into the plugin directory.
* Author: Original Javascript Code: Benjamin Lupu <hide@address.com>
* Translation to PHP & Smarty: Edward Dale <hide@address.com>
* Modification to add a string: Sebastian Kuhlmann <hide@address.com>
* Modification to put the added string before closing <p> or <li> tags by Peter Carter http://www.podhawk.com
-------------------------------------------------------------
*/
function smarty_modifier_html_substr($string, $length, $addstring="")
{

//some nice italics for the add-string
    if (!empty($addstring)) $addstring = "<i> " . $addstring . "</i>";

    if (strlen($string) > $length) {
        if( !empty( $string ) && $length>0 ) {
            $isText = true;
            $ret = "";
            $i = 0;

            $currentChar = "";
            $lastSpacePosition = -1;
            $lastChar = "";

            $tagsArray = array();
            $currentTag = "";
            $tagLevel = 0;

            $addstringAdded = false;

            $noTagLength = strlen( strip_tags( $string ) );

            // Parser loop
            for( $j=0; $j<strlen( $string ); $j++ ) {

                $currentChar = substr( $string, $j, 1 );
                $ret .= $currentChar;

                // Lesser than event
                if( $currentChar == "<") $isText = false;

                // Character handler
                if( $isText ) {

                    // Memorize last space position
                    if( $currentChar == " " ) { $lastSpacePosition = $j; }
                    else { $lastChar = $currentChar; }

                    $i++;
                } else {
                    $currentTag .= $currentChar;
                }

                // Greater than event
                if( $currentChar == ">" ) {
                    $isText = true;

                    // Opening tag handler
                    if( ( strpos( $currentTag, "<" ) !== FALSE ) &&
                        ( strpos( $currentTag, "/>" ) === FALSE ) &&
                        ( strpos( $currentTag, "</") === FALSE ) ) {

                        // Tag has attribute(s)
                        if( strpos( $currentTag, " " ) !== FALSE ) {
                            $currentTag = substr( $currentTag, 1, strpos( $currentTag, " " ) - 1 );
                        } else {
                            // Tag doesn't have attribute(s)
                            $currentTag = substr( $currentTag, 1, -1 );
                        }

                        array_push( $tagsArray, $currentTag );

                    } else if( strpos( $currentTag, "</" ) !== FALSE ) {
                        array_pop( $tagsArray );
                    }

                    $currentTag = "";
                }

                if( $i >= $length) {
                    break;
                }
            }

            // Cut HTML string at last space position
            if( $length < $noTagLength ) {
                if( $lastSpacePosition != -1 ) {
                    $ret = substr( $string, 0, $lastSpacePosition );
                } else {
                    $ret = substr( $string, $j );
                }
            }

            // Close broken XHTML elements
            while( sizeof( $tagsArray ) != 0 ) {
                $aTag = array_pop( $tagsArray );
                // if a <p> or <li> tag needs to be closed, put the add-string in first
                if (($aTag == "p" || $aTag == "li") && strlen($string) > $length) {
                    $ret .= $addstring;
                    $addstringAdded = true;
                }
                $ret .= "</" . $aTag . ">\n";
            }

        } else {
            $ret = "";
        }

        // if we have not added the add-string already
        if ( strlen($string) > $length && $addstringAdded == false) {
            return( $ret.$addstring );
        }
        else {
            return ( $ret );
        }
    }
    else {
        return ( $string );
    }
}
?>