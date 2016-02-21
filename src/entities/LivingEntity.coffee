BaseEntity = require './BaseEntity'
EmptyEntity = require './EmptyEntity'

class LivingEntity extends BaseEntity
  constructor: ->
    super
    @max_health = 400

  died: ->

  tick: ->
    super() and (
      if @health <= 0
        @map.assignEntityToIndex(@map_index, new EmptyEntity(), true)
        @died()
        false
      else
        @setColor(@color[0], @color[1], @color[2], Math.min(255, 20 + Math.round((@health / @max_health)*235)))
        true
    )

module.exports = LivingEntity