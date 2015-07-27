module RoomScheduleContactsHelper
  def scheduling_contact_email
    if @room_schedule_contact.RM_SPPT_CNTCT_EMAIL
      mail_to @room_schedule_contact. RM_SPPT_CNTCT_EMAIL.to_s, "Email Scheduler"
    else
      "Scheduling Contact N/A"
    end
  end

  def support_contact_email
    if @room_schedule_contact.RM_SPPT_CNTCT_EMAIL
      mail_to @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.to_s, "Email Support"
    else
      "Support Contact N/A"
    end
  end

  def floor_plan
    if  File.exist?("#{Rails.root}/public/maps/#{basement}.html")
      link_to "Floor Map", "../maps/#{basement}.html"
    else
      "Floor Map N/A"
    end
  end
end
