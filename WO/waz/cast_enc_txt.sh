#!/usr/bin/bash
# This bash srcript is for installing the KL docker image here
clear

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'
export NC='\033[0m' # No Color

# Commands

hea1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

b1() {
    hea1 "UV Jupyter Lan Installation Commands"
}

# Function will ask for an input and convert to hex
encode_to_hex_input() {
    hea1 "Use cast to convert UTF8 to hex"
    echo -e ""
    echo -e "${BLUE}Write Text to encode: "
    echo -e "--------------------------------${NC}"
    read -r dataz
    if [ -z "$dataz" ]; then
        echo -e "${RED}BASTARD! PutSomething!${NC}"
        exit 1
    fi

    cmd1="cast fa \"$dataz\""
    hex_out=$(eval "$cmd1")
    cmd2="cast tas $hex_out"
    hex_in=$(eval "$cmd2")
    file_name="out.txt"

    echo -e "${CYAN}---Output---${NC}"
    echo -e "${GREEN} ${hex_out} ${NC}"
    echo "---Output---" >${file_name}
    echo "$hex_out" >>${file_name}
    echo -e ""
    echo -e "${YELLOW}---Input---${NC}"
    echo -e "${GREEN} ${hex_in} ${NC}"
    echo "---input---" >>${file_name}
    echo "$hex_in" >>${file_name}
}

#Function that will convert data stored in variable to hex
encodedata__to_hex_input() {
    hea1 "Use cast to convert UTF8 Data to hex"

    read -r -d '' dataz <<'EOF'

 ███████╗ ███╗   ███╗ ███████╗ ██╗      ██╗      ██████╗   █████╗  ███╗   ██╗ ████████╗ ██╗   ██╗
 ██╔════╝ ████╗ ████║ ██╔════╝ ██║      ██║      ██╔══██╗ ██╔══██╗ ████╗  ██║ ╚══██╔══╝ ╚██╗ ██╔╝
 ███████╗ ██╔████╔██║ █████╗   ██║      ██║      ██████╔╝ ███████║ ██╔██╗ ██║    ██║     ╚████╔╝ 
 ╚════██║ ██║╚██╔╝██║ ██╔══╝   ██║      ██║      ██╔═══╝  ██╔══██║ ██║╚██╗██║    ██║      ╚██╔╝  
 ███████║ ██║ ╚═╝ ██║ ███████╗ ███████╗ ███████╗ ██║      ██║  ██║ ██║ ╚████║    ██║       ██║   
 ╚══════╝ ╚═╝     ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝      ╚═╝  ╚═╝ ╚═╝  ╚═══╝    ╚═╝       ╚═╝   

EOF

    cmd1="cast fa \"$dataz\""
    hex_out=$(eval "$cmd1")
    file_name="out.txt"

    echo -e "${CYAN}---Output---${NC}"
    echo -e "${GREEN} ${hex_out} ${NC}"
    echo "---Output---" >${file_name}
    echo "$hex_out" >>${file_name}
    echo -e ""
}

# Send data with the transaction
ca_send_hex() {
    hea1 "Use cast to send hex data"

    read -r -d '' dataz <<'EOF'

 ███████╗ ███╗   ███╗ ███████╗ ██╗      ██╗      ██████╗   █████╗  ███╗   ██╗ ████████╗ ██╗   ██╗
 ██╔════╝ ████╗ ████║ ██╔════╝ ██║      ██║      ██╔══██╗ ██╔══██╗ ████╗  ██║ ╚══██╔══╝ ╚██╗ ██╔╝
 ███████╗ ██╔████╔██║ █████╗   ██║      ██║      ██████╔╝ ███████║ ██╔██╗ ██║    ██║     ╚████╔╝ 
 ╚════██║ ██║╚██╔╝██║ ██╔══╝   ██║      ██║      ██╔═══╝  ██╔══██║ ██║╚██╗██║    ██║      ╚██╔╝  
 ███████║ ██║ ╚═╝ ██║ ███████╗ ███████╗ ███████╗ ██║      ██║  ██║ ██║ ╚████║    ██║       ██║   
 ╚══════╝ ╚═╝     ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝      ╚═╝  ╚═╝ ╚═╝  ╚═══╝    ╚═╝       ╚═╝   

EOF

    make_data="cast fa \"$dataz\""
    hex_out=$(eval "$make_data")

    local -a wallets=(
        "0x991A0FF9529bbC4E1b66cdb47e44DEeD1FcEE999"
        "0x99F23c70837aa99175939077D34F20896CE8D399"
        "0x995D96C5f70087cd6eA3c4F5eB8Ab7DeC3fDbe99"
    )

    local -a keyz=(
        "0x15e64abfed3218cfe2ea1117e38eedb0a51990544534700e61cd803674be31ff"
        "0xe1eae1464d5fe82c12606b62ccdbe0eccb90e2d2134417b459dfb9dfda09f684"
        "0x17c674a1c7e43761479d09d76864c49d516e217006d965ae9df1fbf02ccc241d"

    )

    # Network Configurations (Format: "NetworkName:RPC_URL")
    local -a networks=(
        "https://eth-sepolia.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg"
        "https://eth-holesky.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg"
    )

    # Chains
    local -a chains=(
        "sepolia"
        "holesky"
    )

    CO1="cast send \
  --chain ${chains[1]} \
  --rpc-url ${networks[1]} \
  --private-key ${keyz[0]} \
  ${wallets[1]} ${hex_out} "

    eval "$CO1" 2>&1
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error: ${send_output}${NC}"
        return 1 # Indicate failure
    fi
    echo -e "${GREEN}Transaction successful: ${send_output}${NC}"
    echo -e "${GREEN}Transaction hash: ${send_output}${NC}"

}

# Execution
ca_send_hex
