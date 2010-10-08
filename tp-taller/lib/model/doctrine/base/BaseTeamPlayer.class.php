<?php

/**
 * BaseTeamPlayer
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $team_id
 * @property integer $player_id
 * @property Team $Team
 * @property sfGuardUserProfile $Player
 * 
 * @method integer            getTeamId()    Returns the current record's "team_id" value
 * @method integer            getPlayerId()  Returns the current record's "player_id" value
 * @method Team               getTeam()      Returns the current record's "Team" value
 * @method sfGuardUserProfile getPlayer()    Returns the current record's "Player" value
 * @method TeamPlayer         setTeamId()    Sets the current record's "team_id" value
 * @method TeamPlayer         setPlayerId()  Sets the current record's "player_id" value
 * @method TeamPlayer         setTeam()      Sets the current record's "Team" value
 * @method TeamPlayer         setPlayer()    Sets the current record's "Player" value
 * 
 * @package    tp-taller
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseTeamPlayer extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('team_player');
        $this->hasColumn('team_id', 'integer', 5, array(
             'type' => 'integer',
             'primary' => true,
             'length' => 5,
             ));
        $this->hasColumn('player_id', 'integer', 5, array(
             'type' => 'integer',
             'primary' => true,
             'length' => 5,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Team', array(
             'local' => 'team_id',
             'foreign' => 'id'));

        $this->hasOne('sfGuardUserProfile as Player', array(
             'local' => 'player_id',
             'foreign' => 'id'));

        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($timestampable0);
    }
}