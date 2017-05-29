import QtQuick 2.0

QtObject
{
    property var myVariable
    signal postReady(string responseText);

    // add startsWith function
    function startsWith(source, target) {
        return source.slice(0, target.length) == target;
    }
    // End add startsWith function
    function sendPost(url, params) {
        var http = new XMLHttpRequest()
        http.open("POST", url, true);

        // Send the proper header information along with the request
        http.setRequestHeader("Content-type", "application/json");
        http.setRequestHeader("Content-length", params.length);
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange =  http.onreadystatechange = function() {
            if (http.readyState == 4) {
                if (http.status == 200) {
                    console.log("ok")
                    postReady(http.responseText)
                } else {
                    console.log("error: " + http.status)
                }
            }
        }
        http.send(params);
    }

}
