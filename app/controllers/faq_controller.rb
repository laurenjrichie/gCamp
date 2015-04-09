class FaqController < ApplicationController
  def answers
    @faqs = [
      Faq.new("What is gCamp?", "gCamp is a project management tool."),
      Faq.new("How do I join gCamp?", "Click 'Sign Up' in the navbar."),
    ]
  end
end
