-- ANOMALY ALERT SYSTEM SOFTWARE UPDATER

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
    end
end

-- MAIN PROGRAM
print("Anomaly Alert System Updater")
update_anom()