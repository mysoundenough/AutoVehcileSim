for i=80:10:120
    foundBlock = find_system(gcb, 'BlockType', 'Constant', 'Name', 'Constant');
    objParam = get_param(foundBlock{1}, 'ObjectParameters');
    set_param(foundBlock{1}, 'Value', 'i')
    sim('batch_iteration_SL')
    pause(1)
end
