# Tara O'Malley Hakuna Fermata
# Start new song here

use_debug false
use_bpm 130

# Beat starts here

live_loop :snares do
  sample :drum_snare_soft, amp: 0
  sleep 2
end

with_fx :reverb, room: 0.1 do
  
  with_fx :eq, amp: 2, low: -2, high: -0.2 do
    
    live_loop :beat do
      # make amp of bd_haus 0 to get rid of bass kick
      sample :bd_haus, rate: 0.7, amp: 0
      #sample :bass_hit_c, rate: 1, amp: 3
      sleep 0.5
      sample :drum_cymbal_soft, rate: 1.98, amp: 0, sustain: 0.1, release: 0.2
      sleep 0.5
      
    end
  end
end

# Prelude to bassline

live_loop :prebass do
  stop
  sync :beat
  use_synth :fm
  play :g3, attack: 0, release: 0.2, amp: 1
  # change from 1 to 0.5
  sleep 0.5
end

# Bassline


live_loop :bass do
  stop
  sync :beat
  use_synth :fm
  play :g3, attack: 0, release: 0.2, amp: 1
  sleep 0.5
  play :g3, attack: 0, release: 0.2, amp: 1
  sleep 0.5
  play :g3, attack: 0, release: 0.2, amp: 1
  sleep 0.5
  play :g3, attack: 0, release: 0.2, amp: 1
  sleep 0.25
  play :a3, attack: 0, release: 0.2, amp: 1
  sleep 0.5
  play :a3, attack: 0, release: 0.2, amp: 1
  sleep 0.5
  play :a3, attack: 0, release: 0.2, amp: 1
  sleep 0.25
  play :a3, attack: 0, release: 0.2, amp: 1
  sleep 0.5
  play :a3, attack: 0, release: 0.2, amp: 1
  
end

# Chorus chords

use_synth :piano

live_loop :chords do
  stop
  sync :beat
  play chord( :d5, :min), amp: 2
  sleep 1
  play chord( :d5, :min), amp: 2
  sleep 1
  
  play chord( :a4, :min), amp: 2
  sleep 0.75
  play chord( :a4, :min), amp: 2
  sleep 0.75
  play chord( :a4, :min), amp: 2
  #sleep 0.75
  
  sleep 1
  
  play chord( :d5, :min), amp: 2
  sleep 0.5
  play chord( :d5, :min), amp: 2
  sleep 1
  
  play chord( :d4, :min), amp: 2
  sleep 0.75
  play chord( :d4, :min), amp: 2
  sleep 0.75
  play chord( :d4, :min), amp: 2
  
end

# Playing with mirror notes

notes = [:d4, :e4, :f4, :g4, :a4, :bb4, :c4].ring
notes = notes.sort.mirror.stretch(2)

live_loop :notes do
  stop
  
  if one_in(6)
    use_transpose 2
  else
    use_transpose 0
  end
  
  play notes.tick
  sleep 1
end

# Wobble bassline

live_loop :effects do
  stop
  sync :beat
  with_fx :wobble do
    with_fx :slicer do
      with_fx :reverb do
        play 50, amp: 0.2
        sleep 0.5
        sample :elec_plip
        sleep 0.5
        play 62, amp: 0.2
      end
    end
  end
end

# Playing with chord progressions

progression = (ring, :i, :vi, :ii, :v)

live_loop :prog do
  stop
  play chord_degree(progression.tick, :d3, :minor, 3), release: 4, amp: 3
  sleep 2
end

# Synth beeps

live_loop :synth do
  #stop
  #sync :beat
  with_fx :reverb, mix: 0.4, room: 0.6, damp: 0.8 do
    with_synth :sine do
      play chord( :d5, :min), release: 0.4, amp: 0
      sleep 1.5
      play chord( :d5, :min), release: 0.4, amp: 0
      sleep 1.5
      play chord( :d5, :min), release: 0.4, amp: 0
      sleep 1
    end
  end
end

live_loop :synthTwo do
  #stop
  #sync :synth
  with_fx :reverb, mix: 0.4, room: 0.6, damp: 0.8 do
    with_synth :dsaw do
      play chord( :d5, :min), release: 0.4, amp: 0
      sleep 1.5
      play chord( :d5, :min), release: 0.4, amp: 0
      sleep 1.5
      play chord( :d5, :min), release: 0.4, amp: 0
      sleep 1
    end
  end
end

# end