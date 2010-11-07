<?php

/**
 * RentalDiscipline form base class.
 *
 * @method RentalDiscipline getObject() Returns the current form's model object
 *
 * @package    tp-taller
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseRentalDisciplineForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'rental_id'     => new sfWidgetFormInputHidden(),
      'discipline_id' => new sfWidgetFormInputHidden(),
      'created_at'    => new sfWidgetFormDateTime(),
      'updated_at'    => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'rental_id'     => new sfValidatorChoice(array('choices' => array($this->getObject()->get('rental_id')), 'empty_value' => $this->getObject()->get('rental_id'), 'required' => false)),
      'discipline_id' => new sfValidatorChoice(array('choices' => array($this->getObject()->get('discipline_id')), 'empty_value' => $this->getObject()->get('discipline_id'), 'required' => false)),
      'created_at'    => new sfValidatorDateTime(),
      'updated_at'    => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('rental_discipline[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'RentalDiscipline';
  }

}
