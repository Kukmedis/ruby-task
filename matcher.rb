Spec::Matchers.define :contain do |user|
  match do |obj|
    obj.index(user) != nil
  end

  failure_message_for_should do |obj|
    "expected that #{obj} would contain #{user}"
  end

  failure_message_for_should_not do |obj|
    "expected that #{obj} would not contain #{user}"
  end

  description do
    "contain #{user}"
  end
end

Spec::Matchers.define :be_only_from do |user|
  match do |obj|
    dif = obj-user
    dif == []
  end

  failure_message_for_should do |obj|
    "expected that #{obj} would only from #{user}"
  end

  failure_message_for_should_not do |obj|
    "expected that #{obj} would not be only from #{user}"
  end

  description do
    "is only from #{user}"
  end
end
