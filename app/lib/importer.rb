require 'csv'

class Importer
  DEFAULT_BATCH_IMPORT_SIZE = 100

  attr_accessor :csv_path, :populated_items, :threshold_checker

  def initialize(csv_path)
    self.csv_path          = csv_path
    self.populated_items   = Hash.new
    self.threshold_checker = 0
  end

  class << self
    def import(csv_path)
      new(csv_path).import
    end
  end

  def check_import_threshold
    if threshold_checker < ( defined?(BATCH_IMPORT_SIZE) || DEFAULT_BATCH_IMPORT_SIZE )
      self.threshold_checker += 1
      return
    end

    import_to_database
    reset
  end

  def reset
    populated_items   = {}
    threshold_checker = 0
  end

  def import_remaining_to_database
    import_to_database unless threshold_checker == 0
  end

  def import_to_database
    raise NotImplementedError
  end
end