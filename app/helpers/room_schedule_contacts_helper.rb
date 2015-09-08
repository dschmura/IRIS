module RoomScheduleContactsHelper

  def scheduling_contact_email
    if @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.present?
      mail_to @room_schedule_contact. rm_schd_email.to_s, truncate(@room_schedule_contact.rm_schd_cntct_name, :length => 40)
    else
      "Scheduling Contact Not Available"

    end
  end

  def support_contact_email
    if @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.present?
      mail_to @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.to_s, truncate(@room_schedule_contact.RM_SPPT_DEPT_DESCR, :length => 40)
    else
      "Support Contact Not Available"
    end
  end

  def floor_plan
    if  File.exist?("#{Rails.root}/public/maps/#{basement}.html")
      link_to @classroom.location.name, "../maps/#{basement}.html"
    else
      "Floor Map Not Available"
    end
  end
end
