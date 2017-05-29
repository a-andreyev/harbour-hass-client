/* JSONListModel - a QML ListModel with JSON and JSONPath support
 *
 * Copyright (c) 2012 Romain Pokrzywka (KDAB) (romain@kdab.com)
 * Licensed under the MIT licence (http://opensource.org/licenses/mit-license.php)
 */

import QtQuick 2.0
import "jsonpath.js" as JSONPath

ListModel {
    property string source: ""
    property string json: ""
    property string query: ""
    onSourceChanged: {
        // console.log(source)
        var xhr = new XMLHttpRequest;
        xhr.open("GET", source);
        // Send the proper header information along with the request
        xhr.setRequestHeader("Content-type", "application/json");
        // xhr.setRequestHeader("Connection", "close");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                json = xhr.responseText;
                // console.log("answer:",json)
            }
            // else {
                // console.log(xhr.toString())
            // }
        }
        xhr.send();
    }

    onJsonChanged: updateJSONModel()
    onQueryChanged: updateJSONModel()

    function updateJSONModel() {
        clear();

        if ( json === "" )
            return;

        var objectArray = parseJSONString(json, query);
        for ( var key in objectArray ) {
            // console.log(key)
            var jo = objectArray[key];
            // console.log(jo.state)
            append( jo );
        }
        sync(); // TODO: WorkerScript
    }

    function parseJSONString(jsonString, jsonPathQuery) {
        var objectArray = JSON.parse(jsonString);
        if ( jsonPathQuery !== "" ) {
            // console.log(jsonString)
            objectArray = JSONPath.jsonPath(objectArray, jsonPathQuery);
            // console.log(objectArray)
        }

        return objectArray;
    }
}
