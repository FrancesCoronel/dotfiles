
############################
##  String manipulations  ##
############################

##
 # Perform removeAccents & toLowerCase
 #
 # @param $1 string
 # @return string
cleanString()
{
    cleanStr=$(removeAccents $1)
    cleanStr=$(toLowerCase ${cleanStr})

    echo ${cleanStr}
}

##
 # Credits: http://www.alfredforum.com/topic/2015-encoding-issue/?p=26379
 #
 # @param $1
 # @return string
removeAccents()
{
#    echo $1 | iconv -f utf8 -t ascii//TRANSLIT
    echo $1 | iconv -f UTF8-MAC -t ascii//TRANSLIT
}

##
 # @param $1 string
 # @return string
toLowerCase()
{
    echo "${(L)${1}}"
}

#############################
##  Manage App & App Icon  ##
#############################

APP_PATH=''
APP_ICON=''

##
 # Retrieve App Icon
 #
 # @param $1 string (bin path - usually ${BIN})
 # @return string
getAppIcon()
{
    if [[ -z "${APP_ICON}" ]]; then
        appPath=$(getAppPath $1)
        if [[ -n "${appPath}" ]]; then
            APP_ICON="fileicon:${appPath}"
        fi
    fi

    echo ${APP_ICON}
}

##
 # Retrieve App path
 #
 # @param $1 string (bin path - usually ${BIN})
 # @return string
getAppPath()
{
    if [[ -z "${APP_PATH}" ]]; then
        runPath="$(grep -F -m 1 'RUN_PATH =' $1)"
        runPath="${runPath#*\'}"
        runPath="${runPath%\'*}"
        if [[ -d "${runPath}" ]]; then
            APP_PATH="${runPath}"
        fi
    fi

    echo ${APP_PATH}
}

##########
## JSON ##
##########

ITEMS=()

##
 # Add item (simplified)
 #  doc: https://www.alfredapp.com/help/workflows/inputs/script-filter/json/
 #
 # @param $1 string (title)
 # @param $2 string (subtitle)
 # @param $3 string (arg)
 # @param $4 string (icon)
 # @param $5 string (autocomplete)
addItem()
{
    local item icon iconType iconPath
    icon=$4

    item=$(printf "%s" "{")

    item=$(printf "%s%s," ${item} "$(addItemProperty 'title' $1)")
    item=$(printf "%s%s," ${item} "$(addItemProperty 'subtitle' $2)")
    item=$(printf "%s%s," ${item} "$(addItemProperty 'arg' $3)")
    item=$(printf "%s%s," ${item} "$(addItemProperty 'autocomplete' $5)")
    item=$(printf "%s%s," ${item} "$(addItemProperty 'valid' true)")

    if [[ ! "${icon}" == '' ]]; then
        iconType=$(addItemProperty 'type' '')
        if [[ ${icon} =~ fileicon:* ]]; then
            icon=$(echo ${icon} | sed -e 's/fileicon://g')
            iconType=$(addItemProperty 'type' 'fileicon')
            iconPath=$(addItemProperty 'path' ${icon})
        elif [[ ${icon} == *icns ]]; then
            icon="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/${icon}"
            iconPath=$(addItemProperty 'path' ${icon})
        else
            iconPath=$(addItemProperty 'path' ${icon})
        fi

        item=$(printf "%s\"icon\": {%s,%s}" ${item} ${iconType} ${iconPath})
    fi

    item=${item}$(printf "%s" '}')

    ITEMS+=(${item})



#    read -r -d '' VAR << EOM
#This is line 1.
#This is line 2.
#Line 3.
#$(addItemProperty 'valid' true)
#EOM

}

##
 # Add a property to JSON
 #
 # @param $1 property key
 # @param $2 property value (will be escaped)
addItemProperty()
{
    echo $(printf "\"%s\": \"%s\"" $1 $2)
}

getItems()
{
    local items item nbItems

    items=$(printf "%s" '{')
    items=$(printf "%s\"%s\": %s" ${items} 'items' '[')

    nbItems=${#ITEMS[*]}
#    for item in ${ITEMS[*]}; do
#        items=$(printf "%s%s," ${items} ${item})
    for (( idx=1; idx<=${nbItems}; idx++ )); do
        if [[ ${idx} -eq ${nbItems} ]]; then
            items=$(printf "%s%s" ${items} ${ITEMS[${idx}]})
        else
            items=$(printf "%s%s," ${items} ${ITEMS[${idx}]})
        fi

    done

    items=$(printf "%s%s" ${items} ']')
    items=$(printf "%s%s" ${items} '}')

    echo ${items}
}

###########
## Debug ##
###########

DEBUG_ENABLED=0
DEBUG_FILENAME=''

enableDebug()
{
    if [[ $1 -eq 1 ]]; then
        DEBUG_ENABLED=1
        DEBUG_FILENAME="debug_$(date +'%Y%m%d').log"
        if [[ ! -w ${DEBUG_FILENAME} ]]; then
            echo "" > ${DEBUG_FILENAME}
        fi
    fi

}

addDebug()
{
    if [[ ${DEBUG_ENABLED} -eq 1 ]]; then
        echo $1 >> ${DEBUG_FILENAME}
    fi
}
