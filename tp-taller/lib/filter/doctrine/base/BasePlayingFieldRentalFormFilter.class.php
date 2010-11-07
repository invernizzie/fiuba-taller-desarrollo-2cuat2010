<?php

/**
 * PlayingFieldRental filter form base class.
 *
 * @package    tp-taller
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedInheritanceTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BasePlayingFieldRentalFormFilter extends PlayingFieldFormFilter
{
  protected function setupInheritance()
  {
    parent::setupInheritance();

    $this->widgetSchema   ['disciplines_list'] = new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Discipline'));
    $this->validatorSchema['disciplines_list'] = new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Discipline', 'required' => false));

    $this->widgetSchema->setNameFormat('playing_field_rental_filters[%s]');
  }

  public function addDisciplinesListColumnQuery(Doctrine_Query $query, $field, $values)
  {
    if (!is_array($values))
    {
      $values = array($values);
    }

    if (!count($values))
    {
      return;
    }

    $query
      ->leftJoin($query->getRootAlias().'.RentalDiscipline RentalDiscipline')
      ->andWhereIn('RentalDiscipline.discipline_id', $values)
    ;
  }

  public function getModelName()
  {
    return 'PlayingFieldRental';
  }

  public function getFields()
  {
    return array_merge(parent::getFields(), array(
      'disciplines_list' => 'ManyKey',
    ));
  }
}
