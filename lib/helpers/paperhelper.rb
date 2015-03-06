require 'bibtex'

module PaperHelper
  def get_cites()
    puts @items['/peer_reviewed/']
  end

  def get_papers()
    # read bibtex file
    bib = BibTeX.parse(@items['/publications/'].raw_filename)
    out = String::new()

    #walk through each bibtex entry
    bib.each do |e|

      #get bibtex key, and setup YAML keys
      key = e.key.sub(':', '')
      prep = key+"PREP"
      authorizer = key+"AUTHORIZER"
      doi = key+'DOI'
      bp = key+'BP'
      acceptance = key+'AR'

      #bullet
      out += '* '

      # list in preparation
      unless @item[:"#{prep}"].empty?
        out += '**IN PREPARATION** '
      end

      #walk through each author
      for i in 0..(e.names.length - 1) do
        n = e.names[i]

        #look for me
        if n.first.to_s.match('Jacob')
          out += '**_'
        end

        out += n.first + ' ' + n.last

        #look for me
        if n.first.to_s.match('Jacob')
          out += '_**'
        end

        #check for last author
        unless i+1 == e.names.length
          out += ', '
        else
          out += '. '
        end
      end

      #title
      out += e[:title]

      #location and year
      out += '. _' + e[:journal].to_s + '_ ' + e[:year]

      out += '. (Acceptance rate: **' + @item[:"#{acceptance}"] + '**)'

      #list best paper award
      unless @item[:"#{bp}"].empty?
        out += '**IN PREPARATION** '
      end

      #indent linking
      out += "\n\n\t* "

      #Author-izer link
      #check the value of authorizer YAML
      unless @item[:"#{authorizer}"].empty?
        out += '[' + link_to("ACM Author-izer <i class='fa fa-external-link'></i>", @item[:"#{authorizer}"], :target => "_blank") + ']'
      end

      #DOI link
      #check the value of DOI YAML
      unless @item[:"#{doi}"].empty?
        out += '[' + link_to("DOI <i class='fa fa-external-link'></i>", @item[:"#{doi}"], :target => "_blank") + ']'
      end

      #pre-print link
      out += '[' + link_to("Pre-print <i class='fa fa-file-pdf-o'></i>", @items['/' + key + '/'], :target => "_blank") + ']'
      out += "\n\n"
    end

    return out

  end
end

