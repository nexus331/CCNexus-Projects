-- ANOMALY ALERT SYSTEM SOFTWARE UPDATER

function anom_installer()
    print("Welcome to the Anomaly Alert System Software Installer")
    print("Please select the software you wish to install...")
    print("1. ALS Server")
    print("2. ALS Client")
    io.write("Enter option:")
    option = io.read()

    if option == "1" then
        textutils.slowPrint("Installing ALS Server...")
        shell.run("wget https://raw.githubusercontent.com/nexus331/CCNexus-Projects/refs/heads/main/anomaly_server.lua")
    elseif option == "2" then
        textutils.slowPrint("Installing ALS Client...")
        shell.run("wget https://raw.githubusercontent.com/nexus331/CCNexus-Projects/refs/heads/main/anomaly_alert.lua")
    end
    
end

function update_anom()
    print("Initiating System Update....")
    if fs.exists("anomaly_server.lua") then
        print("Server Software Found!")
        shell.run("delete anomaly_server.lua")
        shell.run("wget https://raw.githubusercontent.com/nexus331/CCNexus-Projects/refs/heads/main/anomaly_server.lua")
        sleep(2)
        shell.run("reboot")
    elseif fs.exists("anomaly_alert.lua") then
        print("Client Software Found!")
        shell.run("delete anomaly_alert.lua")
        shell.run("wget https://raw.githubusercontent.com/nexus331/CCNexus-Projects/refs/heads/main/anomaly_alert.lua")
        sleep(2)
        shell.run("reboot")
    else
        print("No existing installation detected...")
        anom_installer()
    end
end

-- MAIN PROGRAM
print("Anomaly Alert System Updater")
update_anom()