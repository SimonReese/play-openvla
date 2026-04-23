import rlbench
from rlbench.action_modes.action_mode import ActionMode
from rlbench.action_modes.arm_action_modes import ArmActionMode
from rlbench.action_modes.gripper_action_modes import Discrete
from rlbench.backend.utils import task_file_to_task_class
from rlbench.environment import Environment

class IdleAction(ActionMode):

    def action(self, scene, action):
        scene.step()


# Setup environment
act = IdleAction(ArmActionMode(), Discrete())
env = Environment(action_mode=act)

# Launch environment
env.launch()
task_class = task_file_to_task_class("push_buttons")
task = env.get_task(task_class)

# Run env
description, obs = task.reset()
while True:
    task.step([])