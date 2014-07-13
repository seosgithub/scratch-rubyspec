check 'short-circuits evaluation at the first condition to be false' do
  code = %{
    x = nil
    true && false && x = 1
    puts x.inspect
  }
  results = ["be_nil"]

  {:code => code, :results => results}
end

check 'evaluates to the first condition not to be true' do
  code = %{
    puts ("yes" && 1 && nil && true).inspect
    puts ("yes" && 1 && false && true).inspect
  }
  results = ["== nil", "== false"]

  {:code => code, :results => results}
end

check 'evaluates to the last condition if all are true' do
  code = %{
    puts ("yes" && 1).inspect
    puts (1 && "yes").inspect
  }
  results = ["== 1", "== \"yes\""]

  {:code => code, :results => results}
end

check 'evaluates the full set of chained conditions during assignment' do
  code = %{
    x, y = nil
    x = 1 && y = 2
    # "1 && y = 2" is evaluated and then assigned to x
    puts x.inspect
  }
  results = ["== 2"]

  {:code => code, :results => results}
end

check 'treats empty expressions as nil' do
  code = %{
    puts (() && true).inspect
    puts (true && ()).inspect
    puts (() && ()).inspect
  }
  results = ["be_nil", "be_nil", "be_nil"]

  {:code => code, :results => results}
end

check 'short-circuits evaluation at the first condition to be false' do
  code = %{
    x = nil
    true and false and x = 1
    puts x.inspect
  }
  results = ["be_nil"]

  {:code => code, :results => results}
end

check 'evaluates to the first condition not to be true' do
  code = %{
    puts ("yes" and 1 and nil and true).inspect
    puts ("yes" and 1 and false and true).inspect
  }
  results = ["== nil", "== false"]

  {:code => code, :results => results}
end

check 'evaluates to the last condition if all are true' do
  code = %{
    puts ("yes" and 1).inspect
    puts (1 and "yes").inspect
  }
  results = ["== 1", "== \"yes\""]

  {:code => code, :results => results}
end

check 'when used in assignment, evaluates and assigns expressions individually' do
  code = %{
    x, y = nil
    x = 1 and y = 2
    # evaluates (x=1) and (y=2)
    puts x.inspect
  }
  results = ["== 1"]

  {:code => code, :results => results}
end

check 'treats empty expressions as nil' do
  code = %{
    puts (() and true).inspect
    puts (true and ()).inspect
    puts (() and ()).inspect
  }
  results = ["be_nil", "be_nil", "be_nil"]

  {:code => code, :results => results}
end

