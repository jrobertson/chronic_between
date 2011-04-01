#!/usr/bin/env ruby

# file: chronic_between.rb

require 'chronic'
require 'date'
require 'app-routes'

class ChronicBetween
  include AppRoutes
  
  def initialize(s)    
    @s = s
    @route = {}; @params = {}
  end
  
  def within?(date)
    
    dates = []    
    
    ranges(@params, date)
    dates = @s.split(',').map {|x| run_route(x.strip)}
    dates.any? {|d1, d2| date.between? d1, d2}

  end  
  
  private
  
  def ranges(params, date)

    # e.g. Mon-Fri 9:00-16:30
    get %r{(\w+)-(\w+)\s+(\d+:\d+)-(\d+:\d+)$} do 
      
      d1, d2, t1, t2 = params[:captures]
      cdate1, cdate2 = [d1,d2].map {|d| Chronic.parse(d)}
      n_days = (cdate2 - cdate1) / 86400
      
      0.upto(n_days.to_i).map do |n|          
        x = (cdate1.to_date + n).strftime("%d-%b-%y ")
        [DateTime.parse(x + t1), DateTime.parse(x + t2)]
      end        
    end

    # e.g. Saturday
    get %r{^(\w+)$} do
      day = params[:captures].first
      cdate = Chronic.parse(day, :now => (date - 1))
      d1 = DateTime.parse(cdate.strftime("%d-%b-%y") + ' 00:00')
      d2 = d1 + 1
      [d1, d2]
    end

    # e.g. 3:45-5:15
    get %r{^(\d+:\d+)-(\d+:\d+)$} do
      t1, t2 = params[:captures]        
      [t1,t2].map {|t| DateTime.parse(t)}
    end

    # e.g. Mon 3:45-5:15
    get %r{^(\w+)\s+(\d+:\d+)-(\d+:\d+)$} do                                                    
      d, t1, t2 = params[:captures]        
      x = Chronic.parse(d, :now => (date - 1)).strftime("%d-%b-%y ")
      [DateTime.parse(x + t1), DateTime.parse(x + t2)]
    end

    # e.g. Mon-Wed
    get %r{^(\w+)-(\w+)$} do                                                    
      d1, d2 = params[:captures]        
      cdate1, cdate2 = [d1,d2].map {|d| Chronic.parse(d)}
      n_days = (cdate2 - cdate1) / 86400
      
      date = DateTime.parse(cdate1.strftime("%d-%b-%y") + ' 00:00')
      [date, date + n_days.to_i]
    end

  end

end
