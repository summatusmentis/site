require 'flickraw'
module FlickrHelper
	def get_random_photo
		FlickRaw.api_key = '2335728dff21351e25623e12edd45f15'
		FlickRaw.shared_secret = 'babd9e3aee99def4'

		userObj = flickr.people.findByUsername(:username => 'summatusmentis')
		nsid = userObj["nsid"]
		photos = flickr.photos.search(:user_id => nsid, :per_page => '500')
		len = photos.length
		srand
		id = rand(len)
		tmp = nil
		while(tmp.nil?)
			id = rand(len)
			sizes = flickr.photos.getSizes(:photo_id => photos[id].id)
			tmp = sizes.find{|s| s.label == 'Large'}
		end

		photoInfo = photos[id]
		return FlickRaw.url_b(photoInfo)

	end
end
