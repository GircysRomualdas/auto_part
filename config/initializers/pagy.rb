require "pagy/extras/bootstrap"
require "pagy/extras/overflow"

Pagy::DEFAULT[:limit] = 10
Pagy::DEFAULT[:size]  = 9
Pagy::DEFAULT[:overflow] = :last_page
