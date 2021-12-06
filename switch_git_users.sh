current_user_name=$(git config --global user.name)
current_user_email=$(git config --global user.email)
echo "Curent user is $current_user_name with email adress $current_user_email"

switch_user_name=""
switch_user_email=""

if [ "$current_user_email" = "jonas-vihoale.aniglo@videtics.com" ]; then
    switch_user_name="Alexandre REBOUL"
    switch_user_email="alexandre.reboul@videtics.com"
    switch_path_to_id_rsa="./id_rsa_alex"
else
    switch_user_name="Jonas Vihoalé ANIGLO"
    switch_user_email="jonas-vihoale.aniglo@videtics.com"
    switch_path_to_id_rsa="./jonas/id_rsa_jiv_dls"
fi



read -p "Do you wish to switch current user to $switch_user_name with email adress $switch_user_email? (Yy/Nn)" yn
    case $yn in
        [Yy]* ) 
            echo "Switching $current_user_name to $switch_user_name ..."
            git config --global user.name "$switch_user_name"
            echo "Switching $current_user_email to $switch_user_email ..."
            git config --global user.email "$switch_user_email"
            echo "Switching $switch_path_to_id_rsa to id_rsa..."
            cp "$switch_path_to_id_rsa" ./id_rsa
            current_user_name_after_switch=$(git config --global user.name)
            current_user_email_after_switch=$(git config --global user.email)
            echo "Curent user is $current_user_name_after_switch with email adress $current_user_email_after_switch!"
            exit;;
        [Nn]* ) 
            echo "Current user $current_user_name with adress $current_user_email was not changed!"
            exit;;
        * ) echo "Please answer yes or no.";;
    esac
