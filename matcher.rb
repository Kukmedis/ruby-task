Spec::Matchers.define :not_contain do |card|
  match do |obj|
    dif = obj-card
    dif == obj
  end

  failure_message_for_should do |obj|
    "expected that #{obj} would not contain #{card}"
  end

  failure_message_for_should_not do |obj|
    "expected that #{obj} would contain #{card}"
  end

  description do
    "not contain #{card}"
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
