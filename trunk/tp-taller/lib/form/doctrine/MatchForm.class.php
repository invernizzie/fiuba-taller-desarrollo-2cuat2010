<?php

/**
 * Match form.
 *
 * @package    tp-taller
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class MatchForm extends BaseMatchForm
{
  public function configure()
  {
      unset($this['created_at'], $this['updated_at'], $this['owner_id'],
            $this['played'], $this['closed'], $this['local_id'], $this['away_id']);
  }
}
