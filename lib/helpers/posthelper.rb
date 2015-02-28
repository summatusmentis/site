module PostHelper
  def get_created_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end

  def get_published_date(post)
    attribute_to_time(post[:published_at]).strftime('%B %-d, %Y')
  end
end
