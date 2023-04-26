module ApplicationHelper
  def emojis
    ['💵', '💸', '💳', '📚', '🍔', '🍕', '🍎', '☕️', '🍸', '✈️', '🚆', '🛵', '🚲', '🏝️', '🛴', '👑', '💻', '📈', '🎓', '💼', '🎸', '⚽',
     '🏀', '🚗', '🏨', '🐶', '🐱', '🔧']
  end

  def index_page?
    controller_name == 'users' && action_name == 'index'
  end
end
