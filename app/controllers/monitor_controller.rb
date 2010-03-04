class MonitorController < ApplicationController
  def index
    @data=getData(false)
  end
  def json
    # make sure not to send html but text/plain
    headers["Content-Type"] = "application/json" 

    data = getData(true)
    headers["X-JSON"] = data.to_json
    #render :text => data.to_json
    render :text => ""
  end
  def getData(json)
    tasks = [["0 host","/bin/hostname"],
             ["1 date","/bin/date"],
             ["2 uptime","/usr/bin/uptime"],
             ["3 freespace","/bin/df -h"],
             ["4 w","/usr/bin/w"],
             ["5 last","/usr/bin/last -10"],
             ["6 access_log","/usr/bin/tail -10 /var/log/httpd/belote.biz-access_log"],
             ["7 messages","/usr/bin/tail -10 /var/log/messages"]]
    data = {}
    for task in tasks
      process = IO.popen(task[1])
      data[task[0]] = ""
      while line = process.gets
        if (json == true)
          line = CGI::escapeHTML(line)
          line = line.gsub("\t","&#09;")
          line = line.gsub(" ","&nbsp;")
        end
        data[task[0]] = data[task[0]]+line
      end
      process.close
    end
    return data.sort
  end
end
