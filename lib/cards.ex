defmodule Cards do

 def create_deck do
   values = ["Ace","Two","Three","Four","Five"]
   suits = ["Spades","Clubs","Hearts","Diamonds"]

  _cards = for value <- values do
     for suit <- suits do
          "#{value} of #{suit}"
     end
   end
  # List.flatten(cards)

  for suit <- suits , value <- values do
    "#{value} of #{suit}"

    end
 end

 def shuffle(deck) do
    Enum.shuffle(deck)
 end

 def contains?(deck,card) do
    Enum.member?(deck,card)
 end

 def deal(deck,hand_size) do
  Enum.split(deck,hand_size)
 end

 def save(deck,filename) do
  binary = :erlang.term_to_binary(deck)
  File.write(filename,binary)
 end

 def load(filename) do
  # {status,binary} = File.read(filename)
   #case status do
    #:ok -> :erlang.binary_to_term binary
    #:error -> "The file does not exists"
   #end

   case File.read(filename) do
      {:ok,binary} -> :erlang.binary_to_term binary
      {:error,_reason} -> "Yo bro file is not exists"
   end

  end

end