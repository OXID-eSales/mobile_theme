/**
    Saving detected from browser user agent device type to
    req.http.X-UA-Device variable for later usage.
**/
sub oxDefineDeviceTypeRecv {
    if ( req.http.User-Agent ~ "iPad" ||
         req.http.User-Agent ~ "iPhone" ||
         req.http.User-Agent ~ "Android" ||
         req.http.User-Agent ~ "iPod" ||
         req.http.User-Agent ~ "webOS" ) {
        set req.http.X-UA-Device = "mobile";
    } else {
        set req.http.X-UA-Device = "desktop";
    }
}