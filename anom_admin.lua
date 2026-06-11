-- ANOMALY ALERT SYSTEM ADMINISTRATOR APP

-- VARIABLES
network = peripheral.find("modem", rednet.open)
password = "admin@123"
version = "1.0"

-- FUNCTIONS

function yellow_alert()
    print("DEBUG: YELLOW ALERT ISSUED!")
    rednet.broadcast("server_yellow", "anom")
end

function critical_alert()
    print("DEBUG: CRITICAL ALERT ISSUED!")
    rednet.broadcast("server_critical", "anom")
end

function doors_test()
    print("DEBUG: TESTING AUTO DOORS...")
    rednet.broadcast("server_door", "anom")
end

function update()
    print("UPDATING ALL SYSTEMS...")
    rednet.broadcast("update_anom", "anom")
end

function main_menu()
    print("Anomaly Alert System Administrator Panel")
    print("Software Version:", version)
    -- OPTIONS
    print("1. Issue Yellow Alert")
    print("2. Issue Critical Alert")
    print("3. Test Automated Doors")
    print("4. Update ANALS System")

    io.write("Enter Option:")
    option = io.read()

    if option == "1" then
        yellow_alert()
    elseif option == "2" then
        critical_alert()
    elseif option == "3" then
        doors_test()
    elseif option == "4" then
        update()
    end
end

-- MAIN PROGRAM

-- LOGIN
io.write("Enter Administrator Password:")
auth_user = io.read()

if auth_user == password then
    main_menu()
else
    print("Invalid Password!")
    return
end