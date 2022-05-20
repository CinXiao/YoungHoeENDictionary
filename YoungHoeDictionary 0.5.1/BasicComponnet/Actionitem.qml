import QtQuick 2.9
import QtQuick.Controls 2.5
Action
{

    signal openunit(var path);
    property string path:""

    id:root
    onTriggered:
    {
        root.openunit(path)
    }




}
