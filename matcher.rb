Spec::Matchers.define :contain do |user|
  match do |obj|
    obj.index(user) != nil
  end

  failure_message_for_should do |actual|
    "expected that #{obj} would contain #{user}"
  end

  failure_message_for_should_not do |actual|
    "expected that #{obj} would not contain #{user}"
  end

  description do
    "contain #{user}"
  end
end

