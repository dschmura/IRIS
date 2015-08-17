module RoomScheduleContactsHelper

  def scheduling_contact_email
    if @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.present?
      mail_to @room_schedule_contact. RM_SPPT_CNTCT_EMAIL.to_s, "Email Scheduler"
    else
      "Scheduling Contact Not Available"

    end
  end

  def support_contact_email
    if @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.present?
      mail_to @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.to_s, "Email Support"
    else
      "Support Contact Not Available"
    end
  end

  def floor_plan
    if  File.exist?("#{Rails.root}/public/maps/#{basement}.html")
      link_to "Floor Map", "../maps/#{basement}.html"
    else
      "Floor Map Not Available"
    end
  end
end
