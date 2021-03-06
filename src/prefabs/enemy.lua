return {
    components = {
        -- image
        {
            script = 'rope.builtins.graphics.image_renderer',
            arguments = {filename = 'static/img/enemy.png'}
        },
        -- shape
        {
            script = 'rope.builtins.shapes.rectangle',
            arguments = {shapeFrom = 'rope.builtins.graphics.image_renderer'}
        },
        -- motion control
        {
            script = 'components.movement.velocity'
        },
        {
            script = 'components.movement.physics_motor',
            arguments = {axis = 'y', speed = 100, drag = 2}
        },
        {
            script = 'components.movement.random_chase_motor_controller',
            arguments = {
                axis = 'y',
                min = 0.15, max = 0.85,
                motor_script = 'components.movement.physics_motor'
            }
        },
        -- shooting
        {
            script = 'components.shooter',
            arguments = {
                bulletSpeed = -200,
                filename = 'static/img/bullet-left.png',
            }
        },
        {
            script = 'components.random_shoot_controller',
            arguments = {meanWaitTime = 3, waitTimeSigma = 1}
        },
        -- collision
        {
            script = 'rope.builtins.colliders.rectangle_collider',
            arguments = {
                group = 'enemy',
                shape = 'rope.builtins.graphics.image_renderer'
            }
        },
    }
}
